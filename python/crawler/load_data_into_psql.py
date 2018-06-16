import psycopg2
import json
import os
import sys
hostname = 'localhost'
username = os.environ.get('PG_USER', 'postgres')
password = os.environ.get('PG_PASS', 'postgres')
database = 'hello_dev2'

# Simple routine to run a query on a database and print the results:
def doQuery( conn ) :
    cur = conn.cursor()
    path = os.path.expanduser('.')

    fpath = sys.argv[1] if len(sys.argv) > 1 else path +'/crawler-dump.json'
    f = open(fpath, 'r')
    aske_json = json.loads(f.read())

    filters = [("'", "''"),
                  ("\\", "\\\\"),
                  ("\n", "\\n")]

    for entry in aske_json:
        text = entry['text']
        site = entry['url']


        for f in filters:
            text = text.replace(f[0], f[1])
        SQL_QUERY = """
        INSERT INTO "arts"("text", "website")
         VALUES( E'{text}', '{site}');
        """.format(text=text, site=site)



        cur.execute( SQL_QUERY )


def get_arts():
    myConnection = psycopg2.connect( host=hostname, user=username, password=password, dbname=database )
    cur = myConnection.cursor()
    SQL_QUERY = """
        SELECT * FROM "arts";
        """

    cur.execute( SQL_QUERY )
    values = cur.fetchall()
    myConnection.commit()
    myConnection.close()
    return values

if __name__ == '__main__':
    myConnection = psycopg2.connect( host=hostname, user=username, password=password, dbname=database )
    doQuery( myConnection )
    myConnection.commit()
    myConnection.close()

