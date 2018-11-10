# This does not work as a general Eliptic Curve framework
# This is because the addition opperation does not have a
# point at infinity built into it. Where it would return that
# it instead returns None. This is fairly easy to extend.

# This is an implimentation of the
# Hendrik Lenstra EC factoring algorithm


class curve:
    def __init__(self,a,b,n):
        # y^2 = x^3 + ax + b (mod n)
        self.a = a
        self.b = b
        self.n = n



class point:
    def __init__(self,x,y,curve):
        R = IntegerModRing(curve.n)
        self.c = curve
        self.x = R(x)
        self.y = R(y)

    def __add__(self,Q):
        curve = self.c
        n = curve.n
        a = curve.a
        if self.x != Q.x or self.y != Q.y: #not doubling
            if gcd((self.x - Q.x), n) != 1:
                return None
            lam = (self.y - Q.y) / (self.x - Q.x)
        else: # if we're doubling
            if gcd((2*self.y), n) != 1:
                return None
            lam = ((3*self.x) +a )/ 2*self.y
        x = lam**2 - self.x - Q.x
        y = (lam*(self.x - x)) - self.y
        ret = point(x,y,curve)
        return ret


def Lenstra(n):
    # now we need to find a starting point / curve
    # fix point (rand x, rand y)
    # now we need to find an a, b s.t. y^2 = x^3 + ax + b (mod n)
    # and 4a^3 + 27b^2 != 0 (mod n)
    # b = y^2 - x^3 - ax
        x = 1 + random()* 100 // 1
        y = 1 + random()* 100 // 1
        a = 1
        b = y**2 - x**3 - a*x

        C = curve(a,b,n)
        P = point(x,y,C)
        Q = P
        B = 2^14
        exp = lcm(range(1,B))
        current = 1

        while 2 * current < exp:
            Q_0 = Q
            Q = Q + Q #this is our powers of two
            if Q == None:
                # print "doubling broke at", current
                return gcd(2*Q_0.y, n)

            flag = exp % (current *2)
            flag = flag // current
            if flag == 1:
                P_0 = P
                P = P + Q
                if P == None:
                    # print "addition broke at", current
                    return gcd(P_0.x - Q.x, n)

            current = current * 2
        return None

n = 500041 * 500173
for i in range(1,1000):
    print i
    factor = Lenstra(n)
    if factor != None:
        print factor
# n = 97
# C = curve(3,5,n)
# P = point(1,2,C)
# Q = point(3,5,C)
# R = P+P
# if R != None:
#     print R.x,R.y
# else:
#     print R