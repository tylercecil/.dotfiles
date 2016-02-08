"""
Quinn + Tyler Cecil
December 2011

Secret Santa Selector 2000
"""

from Tkinter import *
import tkMessageBox
from random import randint, seed

def build_dict(people, draws):
    dic = {}
    drawdeck = people * draws
    for person in people:
        dic[person.lower()] = []
        while len(dic[person.lower()]) < draws:
            draw = [p for p in drawdeck if p != person and p not in dic[person.lower()]]
            i = randint(0, len(draw) - 1)
            dic[person.lower()].append(draw[i])
            drawdeck.remove(draw[i])
    return dic

def main():

    def getnames():
        s = namebox.get()
        try:
            s = s.split()[0]
            s = s.lower()
            msg = ''
            names = dic.pop(s)
            for name in names:
                msg += name + '\n'
        except:
            s = s[0].upper() + s[1:]
            if s in brothers:
                msg = '!!!SOMEONE CHEATED!!!'
            else:
                msg = "YOU'RE NOT A PERSON!"
        tkMessageBox.showinfo("Say Hello", msg)

    seed()
    brothers = ['Tyler', 'Nick', 'Quinn', 'Henry']
    dic = build_dict(brothers, 2)

    master = Tk()
    master.title("SECTRET SANTA")

    namebox = Entry(master)
    namebox.pack()

    namebox.focus_set()
    #namebox.bind('<Return>', getnames)

    b = Button(master, text="draw", width=10, command=getnames)
    b.pack()
    mainloop()



if __name__ == '__main__':
    main()
