import numpy as np
import matplotlib.pyplot as plt
from astropy.stats import sigma_clip
import glob, sys, os


OUTPUT_DIR = './output'

COLORS = {
	'laptop':'k',
	'mac':'b',
	'osu':'r'
}

LINES = {
	'O0':'-',
	'O1':':',
	'O2':'-.',
	'O3':'--'
}

def main():
	
	data = {}
	speedups = {}
	for mach in ['laptop', 'mac', 'osu']:
		data[mach] = {}
		speedups[mach] = {}
		for opt in ['O0', 'O1', 'O2', 'O3']:
			data[mach][opt] = None
			if opt != 'O0': speedups[mach][opt] = None

	fnames = glob.glob(OUTPUT_DIR+'/times*')
	for ff in fnames:
		opt, mach = ff.split('/')[-1].split('.')
		opt = opt[-2:]
		if opt[0] != 'O': opt = 'O0'
		data[mach][opt] = TimingFile(ff)

	for mach in ['laptop', 'osu', 'mac']:
		speedups[mach] = computeSpeedUp(data[mach])
		plt.figure(1)
		plt.title('O1speedup')
		plt.errorbar(np.arange(98), speedups[mach]['O1'][0], yerr=speedups[mach]['O1'][1], color=COLORS[mach], marker='.', ls=':', label=mach)
		plt.legend()

		plt.figure(2)
		plt.title('O2speedup')
		plt.errorbar(np.arange(98), speedups[mach]['O2'][0], yerr=speedups[mach]['O2'][1], color=COLORS[mach], marker='.', ls=':', label=mach)
		plt.legend()

		plt.figure(3)
		plt.title('O3speedup')
		plt.errorbar(np.arange(98), speedups[mach]['O3'][0], yerr=speedups[mach]['O3'][1], color=COLORS[mach], marker='.', ls=':', label=mach)
		plt.legend()	

	plt.show()


def computeSpeedUp(data):
	O0, O1, O2, O3 = [data[opt] for opt in ['O0', 'O1', 'O2', 'O3']]
	O1sp = (O1.times / O0.times)**-1.
	O1err = O1sp * np.sqrt( (O1.terr/O1.times)**2.0 + (O0.terr/O0.times)**2.0 )

	O2sp = (O2.times / O0.times)**-1.
	O2err = O2sp * np.sqrt( (O2.terr/O2.times)**2.0 + (O0.terr/O0.times)**2.0 )

	O3sp = (O3.times / O0.times)**-1.
	O3err = O3sp * np.sqrt( (O3.terr/O3.times)**2.0 + (O0.terr/O0.times)**2.0 )

	return {'O1':[O1sp, O1err], 'O2':[O2sp, O2err], 'O3':[O3sp, O3err]}

class TimingFile:
	def __init__(self, fname, sigclip=3.):
		results = {}
		for line in open(fname, 'r').readlines():
			if line.startswith('#'):
				N = int(line.strip().split()[-1])
				results[N] = []
			else:
				results[N].append( float( line.strip() ))

		Nstack, time, err = [],[],[]
		for n, times in results.items():
			if n>= 100: break
			Nstack.append(n)
			time_clipped = sigma_clip(times, masked=False, axis=None, maxiters=3, sigma=2.5)
			time.append(time_clipped.mean())
			err.append(time_clipped.std(ddof=1))
		
		self.Nstack = np.array(Nstack)
		self.times = np.array(time)
		self.terr = np.array(err)
if __name__=='__main__':
	main()
