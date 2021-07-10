from promnesia.common import Source
from promnesia.sources import auto

'''
List of sources to use.

You can specify your own, add more sources, etc.
See https://github.com/karlicoss/promnesia#setup for more information
'''

# See https://github.com/karlicoss/promnesia/blob/master/doc/config.py
# for more info on the config.

from promnesia.sources import guess

from promnesia.sources import (
    hypothesis,
    reddit,
    signal,
    takeout,
)


'''
    Source(
        auto.index,
        # just some arbitrary directory with plaintext files
        '/usr/include/c++/',
        name='random c++ files'
    ),
'''

SOURCES = [
    Source(
        auto.index,
        '/home/mr_robot/Documents/hpi-second-brain/exports/joplin',
        name='joplin',
    ),
    Source(hypothesis.index),
    Source(reddit.index),
    Source(signal.index, '/home/mr_robot/Documents/hpi-second-brain/exports/signal/sql/db.sqlite'),
    Source(takeout.index),
]

''''
Optional setting.
A directory where promnesia.sqlite will be stored.
If not specified, user data directory is used, e.g. ~/.local/share/promnesia/
see https://github.com/ActiveState/appdirs#some-example-output for different OS
'''
OUTPUT_DIR = '/home/mr_robot/Documents/hpi-second-brain/promnesia/'

'''
Optional setting.
A directory to keep intemediate caches in order to speed up indexing.
If not specified, will use user cache directory
If set to None, cache is disabled
'''
CACHE_DIR = '/tmp/promnesia_cache/'

'''
Optional setting.
You can specify the URLs you don't want to be indexed.
You might want it because there are too many of them, or for security/privacy reasons.
'''
FILTERS = [
    'onlinesbi.com',
    'netbanking.*',
    'americanexpress.com.',
    'reddit.com',
    'youtube.com',

    # you can use regexes too!
    # 'redditmedia.com.*.(jpg|png|gif)',
]

