import hashlib


def get_lowest_hash_number(puzzle_input):
    number = 1
    while True:
        # Get hash with leading 5 zeros
        hash_key = (puzzle_input + str(number)).encode('utf-8')
        hashed = hashlib.md5(hash_key).hexdigest()
        if(hashed[0:6] == "000000"):
            return number
        number += 1


if __name__ == '__main__':
    print(get_lowest_hash_number("ckczppom"))
