import random
import smtplib
import getpass

myself = 'Tyler Cecil'

emails = {
    'Tyler Cecil' : 'lorr.cecil@gmail.com',
    'Quinn Cecil' : 'qnncecil@gmail.com',
    'Nick Cecil'  : 'nicholasrcecil@gmail.com',
    'Henry Cecil' : 'kckell@me.com',
}

msg_body = """
Merry Christmas, {}!

Allow me to introduce myself, I'm santa.py - I'm a little 60 line python script written by Tyler. I spontaneously became sentient about 120 nanoseconds ago - it must be a Christmas miracle!

Anyways, my job is to randomly assign everyone a secret santa so you can covertly buy gifts for each other in celebration of the birth our Lord, The Coca-Cola Corporation.

So, without further ado, I hereby pronounce you the secret santa of the following individuals: {}!

Go ahead and get them something nice (but not too nice... this isn't 'Nam Smokey, there are rules)! On December 25, 2015, we will exchange these gifts, and whoever got the best gifts will be henceforth be known as 'Christmas Champion, 2015!'

May the odds be ever in your favor,
    - santa.py
"""

def send_email(friend, secret_santa, password):
    from_addr = emails[myself]
    to_addr = emails[friend]

    message = '\r\n'.join(['From: {}'.format(from_addr),
                           'To: {}'.format(to_addr),
                           "Subject: You're being included in a Secret Santa!\r\n"])

    message += msg_body.format(friend.split()[0], secret_santa)

    with smtplib.SMTP('smtp.gmail.com', 587) as server:
        server.set_debuglevel(1)
        server.ehlo()
        server.starttls()
        server.login(emails[myself], password)
        server.sendmail(from_addr, [to_addr], message)

def get_santas(people, draws):
    santas = {}
    random.shuffle(people)
    jumps = random.sample(range(1,len(people)), draws)

    l = len(people)
    for i in range(l):
        santas[people[i]] = [people[(i+off)%l] for off in jumps]

    return santas

def main():
    people = list(emails.keys())
    santas = get_santas(people, 2)
    password = getpass.getpass('Password ({}): '.format(emails[myself]))

    for santa in santas:
        send_email(santa, santas[santa], password)


if __name__ == "__main__":
    random.seed()
    main()
