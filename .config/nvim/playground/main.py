"""
This module is a test
"""


def prime(prime_num: int):
    """
    Return true if prime_num is prime, false otherwise
    """
    if prime_num < 2:
        return False
    for i in range(2, int(prime_num**0.5) + 1):
        if prime_num % i == 0:
            return False
    return True


def main():
    """main function"""
    print(prime(2))


if __name__ == "__main__":
    main()
