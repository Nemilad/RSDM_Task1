import sys
from datetime import datetime, timezone
import pytz
curr_datetime = str(datetime.now(pytz.timezone('Europe/Moscow')))
import httpagentparser


def application(environ, start_response):
    status = '200 OK'
    raw_user_agent = environ.get('HTTP_USER_AGENT', None)
    output = u''
    output += u'raw user-agent: %s\n' % repr(raw_user_agent)
    output += u'user info: %s\n' % repr(httpagentparser.simple_detect(raw_user_agent))
    output += u'Current date and time: %s\n' % repr(curr_datetime)

    response_headers = [('Content-type', 'text/plain'),
                        ('Content-Length', str(len(output)))]
    start_response(status, response_headers)

    return [output.encode('UTF-8')]
