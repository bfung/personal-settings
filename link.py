#!/usr/bin/env python
"""Links files to home directory.
"""

import argparse
import os
import sys
import time

class _ReadableDirType(argparse.Action):
    """An argparse.Action that validates a readable directory
    """

    def __call__(self, parser, namespace, values, option_string=None):
        """Check that the argument is a readable directory"""
        tmp_dir = os.path.abspath(os.path.expanduser(values))
        if not os.path.isdir(tmp_dir):
            raise argparse.ArgumentError(self,
                "{} is not a valid path".format(tmp_dir))
        if os.access(values, os.R_OK):
            setattr(namespace, self.dest, tmp_dir)
        else:
            raise argparse.ArgumentError(self,
                "{} is not readable".format(tmp_dir))

def parse_args():
    """Parses command line arguments."""
    parser = argparse.ArgumentParser(
                description='Create links to configuration files')

    parser.add_argument('-d', '--default', dest='default_dir', default='.',
                        action=_ReadableDirType,
                        metavar='DEFAULT_DIR',
                        help='the directory of default configuration files')

    parser.add_argument('-s', '--specific', dest="specific_dir", default='.',
                        action=_ReadableDirType,
                        metavar='SPECIFIC_DIR',
                        help='lowest subdirectory to traverse down to.')

    return parser.parse_args()

def build_link_data(default_dir, *override_dirs):
    """Link the files"""
    to_link = {}
    script = os.path.abspath(os.path.dirname(__file__))
    add_dirs = []
    add_dirs.append(os.path.abspath(os.path.expanduser(default_dir)))
    add_dirs.extend(override_dirs)
    print add_dirs
    for add_dir in add_dirs:
        print "Processing {}".format(add_dir)
        for filename in os.listdir(add_dir):
           filepath = os.path.abspath(os.path.join(add_dir, filename))
           print "File {}".format(filepath)
           if filepath != script and os.path.isfile(filepath):
               to_link[filename] = filepath
    
    return to_link

def link_files(home_dir, links):
    print "home_dir: {}".format(home_dir)
    for k, v in links.viewitems():
        link_abs = os.path.abspath(os.path.join(home_dir, k))
        print "file: {}, repo: {}, link: {}".format(k, v, link_abs)
        if os.path.isfile(link_abs):
            since_epoch = int(time.mktime(time.gmtime()))
            os.rename(link_abs, '{}.{}.old'.format(link_abs, since_epoch)) 
        if os.path.isdir(link_abs):
            print "{} is a directory, cannot replace with file safely." \
                  .format(link_abs)
            continue
        else:
            print "Linking... {} to {}".format(v, link_abs)
            os.symlink(v, link_abs)
            print "Linked {} to {}".format(v, link_abs)

if __name__ == '__main__':
    args = parse_args()
    links = build_link_data(args.default_dir, args.specific_dir)
    print links
    link_files(os.path.abspath(os.path.expanduser('~/')), links) 
    print "Done."

