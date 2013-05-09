'''
Created on Apr 21, 2013

@author: Matthew Baker
'''

import string, sys

def toData(code, XorN):
	parsed = string.split(code,' R')
	data = 0
	if (len(parsed) == 4):
		data = (int(parsed[1][0]) << 9) + (int(parsed[2][0]) << 6) + int(parsed[3][0])
		
	elif (len(parsed) == 3):
		data = (int(parsed[1][0]) << 9) + (int(parsed[2][0]) << 6)

	else:
		print 'Bad '+parsed[0]+'command'
	
	if (XorN == False):
		data += (aluxOP(parsed[0]) << 3) + (8<<12)# use ALUx
	if (XorN == True):
		data += (alunOP(parsed[0]) << 3) + (9<<12) # use ALUn
	
	return data

def aluxOP(op):
    return{
		'SUB' : 0,
		'OR' : 1,
		'XOR' : 2,
		'MULT' : 3,
		'DIV' : 4,
		'NAND' : 5,
		'NOR' : 6,
		}[op]

def alunOP(op):
	return{
		'NEG' : 0,
		'BSWAP' : 1,
		'BADD' : 2,
		'SXB' : 3,
		'ZXB' : 4,
		'MAX' : 5,
		'MIN' : 6,
		}[op]

def main(argv):
	inputFile = argv[1]
	outputFile = argv[2]
	f = open(inputFile,'r+')
	outf = open(outputFile,'w+')
	print 'Converting', inputFile,'into',outputFile,'...'
	for line in f:
		iSub = 0
		iOr =  0
		iXor =  0
		iMult = 0
		iDiv =  0
		iNand =  0
		iNor =  0
				
		iNeg = 0
		iBswap = 0
		iBadd = 0
		iSxb = 0
		iZxb = 0
		iMax = 0
		iMin = 0
		
		iSub =  string.find(line,'SUB')   # LC3X[0]
		iOr =  string.find(line,'OR')     # LC3X[1]
		iXor =  string.find(line,'XOR')   # LC3X[2]
		iMult = string.find(line,'MULT')  # LC3X[3]
		iDiv =  string.find(line,'DIV')   # LC3X[4]
		iNand =  string.find(line,'NAND') # LC3X[5]
		iNor =  string.find(line,'NOR')   # LC3X[6]
		
		iNeg =  string.find(line,'NEG')     # LC3N[0]
		iBswap =  string.find(line,'BSWAP') # LC3N[1]
		iBadd =  string.find(line,'BADD')   # LC3N[2]
		iSxb = string.find(line,'SXB')      # LC3N[3]
		iZxb =  string.find(line,'ZXB')     # LC3N[4]
		iMax =  string.find(line,'MAX')     # LC3N[5]
		iMin =  string.find(line,'MIN')     # LC3N[6]
		
		if ((iOr >= 0) and ((line[iOr-1] == 'X') or (line[iOr-1] == 'N'))):
			iOr = -1
		
		LC3X = [iSub, iOr, iXor, iMult, iDiv, iNand, iNor]
		LC3N = [iNeg, iBswap, iBadd, iSxb, iZxb, iMax,iMin]
		printed = False
		for i in LC3X:
			if i >= 0:
				printed = True
				sublines = string.split(line,';')
				code = sublines[0]
				comment = ''
				if len(sublines) > 1:
					comment = ";" + sublines[1]
				code = string.strip(code)
				comment = string.strip(comment)
				data = toData(code, False)
				lineout = "  DATA2 4x%0.2X" % data + ' \t\t; ' + code + ' \t'+ comment + '\n'
				outf.write(lineout)
		
		for i in LC3N: 
			if i >= 0:
				printed = True
				sublines = string.split(line,';')
				code = sublines[0]
				comment = ''
				if len(sublines) > 1:
					comment = ";" + sublines[1]
				code = string.strip(code)
				comment = string.strip(comment)
				data = toData(code, True)
				lineout = "  DATA2 4x%0.2X" % data + ' \t\t; ' + code + ' \t'+ comment + '\n'
				outf.write(lineout)
                
		if printed == False:
			outf.write(line)
	f.close()
	outf.close()
	print "File converted"

if __name__ == '__main__':
	main(sys.argv)
	pass
