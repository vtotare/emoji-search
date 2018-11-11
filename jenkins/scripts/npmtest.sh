#!/usr/bin/env sh

echo 'The following "npm" command tests that your simple Node.js'
echo 'application renders satisfactorily. This command actually invokes the test'
set -x
npm test || exit 1
