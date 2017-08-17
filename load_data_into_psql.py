import psycopg2
import json

hostname = 'localhost'
username = 'postgres'
password = 'postgres'
database = 'hello_dev2'

# Simple routine to run a query on a database and print the results:
def doQuery( conn ) :
    cur = conn.cursor()

    f = open('/Users/codyscharfe/mdev/ascii-api/animal.json','r')
    animal_json = json.loads(f.read())

    for entry in animal_json[:10]:
        text = entry['text']
        site = entry['url']

        filters = [("'", "''"),
                  ("\\", "\\\\"),
                  ("\n", "\\n")]
        for f in filters:
            text = text.replace(f[0], f[1])
        SQL_QUERY = """
        INSERT INTO "public"."aa"("text", "site")
         VALUES( E'{text}', '{site}');
        """.format(text=text, site=site)
        # SQL_QUERY = """
        # INSERT INTO "public"."aa"("text", "site")
        #  VALUES( E'{text}', '{site}');
        # """.format(text=text, site=site)


        cur.execute( SQL_QUERY )


def get_arts():
    myConnection = psycopg2.connect( host=hostname, user=username, password=password, dbname=database )
    cur = myConnection.cursor()
    SQL_QUERY = """
        SELECT * FROM "aa";
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

# print "Using PyGreSQL…"
# import pgdb
# myConnection = pgdb.connect( host=hostname, user=username, password=password, database=database )
# doQuery( myConnection )
# myConnection.close()