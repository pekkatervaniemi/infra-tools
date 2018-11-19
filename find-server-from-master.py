

nested_list = []
h2 = []
hostit = []
i = 0
r = 0

"""
h2 file /t fields
Service	server	id	Role
  Sales service	server1	00001	production

hosts
server1
server2

Finds servers from h2 and combines lines.

"""

h2file = ".csv"
hosts = ".txt"

storagearray = "storage1"

# open file and read the content in a list
with open(h2file, encoding="utf8") as filehandle:  
    for line in filehandle:
        currentPlace = line[:-1]
        h2.append(currentPlace)

with open(hosts, encoding="utf8") as filehandle:  
    for line in filehandle:
        currentPlace = line[:-1]
        hostit.append(currentPlace)

for words in h2:
    list1 = words.split("\t")
    nested_list.append(list1)

for tarkasta in hostit:
    for inner in nested_list:
        if inner[1] == tarkasta:
            print (storagearray + " " + inner[1] + " " + inner[0] + " " + inner[2] )
 
