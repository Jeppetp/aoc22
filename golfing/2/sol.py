print(list(map(sum,zip(*[[3*((v:=(ord(y))%ord(x)+2)%3)+(v-1)%3+1,3*((v-1)%3)+(ord(x)+v-1)%3+1,]for x,_,y,_ in open("i").readlines()]))))
