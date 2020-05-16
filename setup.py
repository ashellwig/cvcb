from setuptools import setup
from distutils.util import convert_path

from typing import Dict, Any

# Version Information
main_ns: Dict[Any, Any] = {}
version_path = convert_path('cvcb/version.py')
with open(version_path) as version_file:
    exec(version_file.read(), main_ns)

# Long Description via README.md
with open('README.md', 'r') as fh:
    long_description: str = fh.read()

setup(name='cvcb',
      version=main_ns['__version__'],
      description='''
        Helps with the job application process by automatically cycling through
        your job details on the clipboard.
        ''',
      long_description=long_description,
      url='https://github.com/ashellwig/cvcb',
      packages=['cvcb'],
      include_package_data=True,
      install_requires=['Click==7.1.2'],
      entry_points={'console_scripts': ['cvcb=cvcb:cli']},
      zip_safe=False,
      classifiers=[
          'Development Status :: 1 - Planning', 'Environment :: Console',
          'License :: OSI Approved :: GNU Affero General Public License v3',
          'Intended Audience :: End Users/Desktop',
          'Natural Language :: English',
          'Operating System :: Microsoft :: Windows :: Windows 10',
          'Operating System :: POSIX :: Linux',
          'Programming Language :: Python :: 3.8',
          'Programming Language :: Python :: 3 :: Only',
          'Topic :: Software Development :: Libraries :: Python Modules',
          'Typing :: Typed'
      ])
