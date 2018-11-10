#This file contains an implimentation of Pollard's p-1 factoring algorithm.

def Pollard(n,B):
    a = 7
    exp = lcm(range(1,B))
        # exp is the B! (more or less)
        # remeber that (p-1) is a product of prime powers each less than B
        # so if you consider the full range up to B and take the least common multiple of the elements
        # it will be the product of the greatest prime power less than B for each prime (less than B)
        # so it will be divisible by any of the constiutent prime powers less than B
    a_to_B = pow(a,exp,n)
    p = gcd(a_to_B-1,val)
    q = n/p
    return [p,q]


# example:
print Pollard(38568900844635025971879799293495379321,2^14)
# output: [17495058332072672321, 2204559716953267001]