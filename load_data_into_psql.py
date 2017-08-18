import psycopg2
import json
import os

hostname = 'localhost'
username = 'postgres'
password = 'postgres'
database = 'hello_dev2'

# Simple routine to run a query on a database and print the results:
def doQuery( conn ) :
    cur = conn.cursor()
    path = os.path.expanduser('.')
    f = open(path+'/crawler-dump.json','r')
    aske_json = json.loads(f.read())

    for entry in aske_json[:10]:
        text = entry['text']
        site = entry['url']

        filters = [("'", "''"),
                  ("\\", "\\\\"),
                  ("\n", "\\n")]
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

