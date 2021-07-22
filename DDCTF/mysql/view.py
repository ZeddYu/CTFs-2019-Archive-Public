# coding=utf-8

from flask import jsonify, request
from struct import unpack
from socket import inet_aton
import MySQLdb
from subprocess import Popen, PIPE
import re
import os
import base64


# flag in mysql  curl@localhost database:security  table:flag

def weak_scan():

    agent_port = 8123
    result = []
    target_ip = request.args.get('target_ip')
    target_port = request.args.get('target_port')
    if not target_ip or not target_port:
        return jsonify({"code": 404, "msg": "åæ°ä¸è½ä¸ºç©º", "data": []})
    if not target_port.isdigit():
        return jsonify({"code": 404, "msg": "ç«¯å£å¿é¡»ä¸ºæ°å­", "data": []})
    if not checkip(target_ip):
        return jsonify({"code": 404, "msg": "å¿é¡»è¾å¥ip", "data": []})
    if is_inner_ipaddress(target_ip):
        return jsonify({"code": 404, "msg": "ipä¸è½æ¯åç½ip", "data": []})
    tmp_agent_result = get_agent_result(target_ip, agent_port)
    if not tmp_agent_result[0] == 1:
	tem_result = tmp_agent_result[1]
        result.append(base64.b64encode(tem_result))
        return jsonify({"code": 404, "msg": "æå¡å¨æªå¼å¯mysql", "data": result})

    tmp_result =mysql_scan(target_ip, target_port)

    if not tmp_result['Flag'] == 1:
        tem_result = tmp_agent_result[1]
        result.append(base64.b64encode(tem_result))
        return jsonify({"code": 0, "msg": "æªæ«æåºå¼±å£ä»¤", "data": []})
    else:
        tem_result = tmp_agent_result[1]
        result.append(base64.b64encode(tem_result))
        result.append(tmp_result)
        return jsonify({"code": 0, "msg": "æå¡å¨å­å¨å¼±å£ä»¤", "data": result})


def checkip(ip):
    p = re.compile('^((25[0-5]|2[0-4]\d|[01]?\d\d?)\.){3}(25[0-5]|2[0-4]\d|[01]?\d\d?)$')
    if p.match(ip):
        return True
    else:
        return False

def curl(url):
    tmp = Popen(['curl', url, '-L', '-o', 'content.log'], stdout=PIPE)
    tmp.wait()
    result = tmp.stdout.readlines()
    return result

def get_agent_result(ip, port):

    str_port = str(port)
    url = 'http://'+ip + ':' + str_port
    curl(url)
    if not os.path.exists('content.log'):
        return (0, 'æªå¼å¯agent')
    with open('content.log') as f1:
        tmp_list = f1.readlines()
        response = ''.join(tmp_list)
    os.remove('content.log')
    if not 'mysqld' in response:
        return (0, response)
    else:
        return (1, response)


def ip2long(ip_addr):

    return unpack("!L", inet_aton(ip_addr))[0]

def is_inner_ipaddress(ip):

    ip = ip2long(ip)
    return ip2long('127.0.0.0') >> 24 == ip >> 24 or \
            ip2long('10.0.0.0') >> 24 == ip >> 24 or \
            ip2long('172.16.0.0') >> 20 == ip >> 20 or \
            ip2long('192.168.0.0') >> 16 == ip >> 16

def mysql_scan(ip, port):

    port = int(port)
    weak_user = ['root', 'admin', 'mysql']
    weak_pass = ['', 'mysql', 'root', 'admin', 'test']
    Flag = 0
    for user in weak_user:
        for pass_wd in weak_pass:
            if mysql_login(ip,port, user, pass_wd):
                Flag = 1
                tmp_dic = {'weak_user': user, 'weak_passwd': pass_wd, 'Flag': Flag}
                return tmp_dic
            else:
                tmp_dic = {'weak_user': '', 'weak_passwd': '', 'Flag': Flag}
                return tmp_dic



def mysql_login(host, port, username, password):
    '''mysql login check'''

    try:
        conn = MySQLdb.connect(
            host=host,
            user=username,
            passwd=password,
            port=port,
            connect_timeout=1,
            )
        print ("[H:%s P:%s U:%s P:%s]Mysql login Success" % (host,port,username,password),"Info")
        conn.close()
        return True
    except MySQLdb.Error, e:

        print ("[H:%s P:%s U:%s P:%s]Mysql Error %d:" % (host,port,username,password,e.args[0]),"Error")
        return False