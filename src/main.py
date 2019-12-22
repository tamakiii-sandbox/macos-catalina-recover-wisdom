import sys
import plistlib

plist = plistlib.loads(sys.stdin.buffer.read())
results = sorted(
        list(filter(lambda asset: asset['DictionaryIdentifier'] == 'com.apple.dictionary.ja-en.WISDOM', plist['Assets'])),
        key=lambda d:d['_CompatibilityVersion']
        )

if len(results) <= 0:
    raise ValueError('No "com.apple.dictionary.ja-en.WISDOM" found.');

print(results[0]['__BaseURL'] + results[0]['__RelativePath'])
