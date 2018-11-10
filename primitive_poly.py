# This file was used as a tool to help find a projectively primitive polynomial.
# These polynomials are useful for generating full cycle pseudo random number generators.


poly = [-1,0,2]
import math



N = 5
inv = [0,1,3,2,4]
sqrs = set([1,4])

def printp(p):
    print p[0],
    for i in range(1,len(p)):
        if p[i] != 0:
            print str(p[i])+ "x^" +str(i),
    print

def polyadd(p1,p2,n):
    ret = []
    for i in range(0, max(len(p1),len(p2))):
        ret.append(0)
        p1.append(0)
        p2.append(0)
        ret[i] = (p1[i]+ p2[i]) % n
    return ret

def polymult(p1,p2,n):
    ret = []
    for i in range(0, len(p1)+len(p2)-1):
        ret.append(0)
    for i in range(0, len(p1)):
        for j in range(0, len(p2)):
            ret[i+j] += (p1[i] * p2[j]) % n
    return ret

def irreducible2(p):
    val = p[1] - 4*p[2]*p[0] % N
    return val not in sqrs

def simplify(p,ref):
    if(p[2] == 0):
        return p
    else:
        a = ref[2]
        d = p[2]
        ratio = -1 * d * inv[a]
        replace = polymult([ratio],ref,N)
        replace[2] = 0
        p[2] = 0
        return polyadd(p,replace,N)

def primpoly(p):
    if not irreducible2(p):
        print "reducible"
        return False
    check = [0,1]
    printp(check)
    for x in xrange(0,4):
        check = polymult(check,[0,1],N)
        check = simplify(check,p)
        printp(check)
        if(check[1] == 0):
            return False
    return True


# for c in xrange(0,5):
#     for b in xrange(0,5):
#         for a in xrange(1,5):
#             if primpoly([a,b,c]):
#                 print "*****", a,b,c, "*****"
#             else:
#                 print "////", a,b,c, "////"

# primpoly([1,4,4])


print simplify([0,0,1],[3,1,4])