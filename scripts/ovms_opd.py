class initPlotObject():
	"""Creates inital plot objects

	Attributes:
        name (str): name of data series
        title (str): title of plot
		units (str): units of measurement 

	"""

	def __init__(self, name, title, units):
		self.name = name
		self.title = title
		self.units = units

def plot_time_series(obj):
	"""Plots time series data for respective object

	Args:
        obj (object):

	"""
	pass

def plot_all():
	"""Plots all time series data"""
	pass

opd_object = initPlotObject('opd', 'OPD', 'microns')
sx_tilt_object = initPlotObject('sxtilt', 'SX Tilt', 'asecs')
sx_tip_object = initPlotObject('sxtip', 'SX Tip', 'asecs')
dx_tilt_object = initPlotObject('dxtilt', 'DX Tilt', 'asecs')
dx_tip_object = initPlotObject('dxtip', 'DX Tip', 'asecs')
