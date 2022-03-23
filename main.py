from BencodeDecode import Decode
import sys
import json

dec = Decode(sys.argv[1])
dec.decodeFullFile()
if 'announce-list' in dec.dic and len(dec.dic['announce-list']) > 0:
  del dec.dic['announce-list']
  
del dec.dic['creation date']
del dec.dic['created by']

if 'files' in dec.dic['info'] and len(dec.dic['info']['files']) > 0:
  del dec.dic['info']['files']
  
if 'pieces' in dec.dic['info'] and len(dec.dic['info']['pieces']) > 0:
  del dec.dic['info']['pieces']
  
print(json.dumps(dec.dic, indent=4, sort_keys=True))
