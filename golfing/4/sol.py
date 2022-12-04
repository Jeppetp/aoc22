print(list(map(sum,zip(*[[[g,h]in[[x,y],[z,w]],(g:=max(x,z))<=(h:=min(y,w))]for[[x,y],[z,w]]in[[a.split('-')for a in line[:-1].split(',')]for line in open("t")]]))))
