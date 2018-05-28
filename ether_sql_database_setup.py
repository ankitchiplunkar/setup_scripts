import pexpect
import os

child = child = pexpect.spawn('sudo -u postgres createuser -s -P -e $USER')
child.expect("Enter password for new role: ")
child.sendline(os.environ['PSQL_PASSWORD'])
child.expect("Enter it again: ")
child.sendline(os.environ['PSQL_PASSWORD']))
