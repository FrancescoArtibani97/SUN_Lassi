# coding: utf-8

import codecs

print("Starting...")

seeds = ""
giorni= ["Lunedì","Martedì","Mercoledì","Giovedì","Venerdì"]
corsi = []
inFiles = []

print("Opening files...")
inFile1 = codecs.open("1.txt", 'r', 'utf-8')
inFiles.append(inFile1)
inFile2 = codecs.open("2.txt", 'r', 'utf-8')
inFiles.append(inFile2)
inFile3 = codecs.open("3.txt", 'r', 'utf-8')
inFiles.append(inFile3)
outFile = codecs.open("seeds.rb", 'w', 'utf-8')
print("Files opened.")

print("Extracting informations...")
for f in inFiles:
    data_inizio = f.readline()
    data_fine   = f.readline()

    riga = f.readline().strip()
    while riga != "STOP":
        ora_inizio, ora_fine = riga.split("-")
        for i in range(0,5):
            riga = f.readline().strip()
            if riga == "Tutoraggio":
                corso = riga +" di "+ f.readline().strip()
                riga = f.readline().strip()
                if riga == "canale 1" or riga == "canale 2" or riga == "canali 1 e 2":
                    corso += " - " + riga
                    professore = "nil"
                    aula = f.readline().strip()
                else:
                    professore = "nil"
                    aula = riga
            elif riga == "$":
                continue
            else:
                corso = riga
                riga = f.readline().strip()
                if riga == "canale 1" or riga == "canale 2" or riga == "canali 1 e 2":
                    corso += " - " + riga
                    professore = f.readline().strip()
                    aula = f.readline().strip()
                else:
                    professore = riga
                    aula = f.readline().strip()
            lecture = "Lecture.create(giorno: \'"+giorni[i]+"\', oraInizio: \'"+ora_inizio+"\', oraFine: \'"+ora_fine+"\', aula: \'"+aula+"\', course: \'"+corso+"\')"
            seeds += lecture + "\n"
            #print("Lecture added.")
            if corso not in corsi and corso != "nil":
                course = "Course.create(professore: \'"+professore+"\', materia: \'"+corso+"\', dataInizio: \'"+data_inizio+"\', dataFine: \'"+data_fine+"\')"
                seeds += course + "\n"
                #print("Course added.")
                corsi.append(corso)
        riga = f.readline().strip()
print("Extraction completed.")
            
print("Creating seeds.rb...")
outFile.write(seeds)
print("seeds.rb created.")

print("Closing opened files...")
outFile.close()
for f in inFiles:
    f.close()
print("Files closed.")

print("Finished.")
