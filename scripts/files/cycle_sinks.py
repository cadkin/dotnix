#!/usr/bin/env python3

import subprocess
from optparse import OptionParser

def arg_parse():
    parser = OptionParser();
    parser.add_option("-f", "--sink-file",      dest="sink_file",      help="File to load sink definitions from. Attempts to discover sinks automatically if not specified.", metavar="FILE");
    parser.add_option("-n", "--no-notify-send", dest="no_notify_send", help="Don't send notifications using notify-send.", default=False, action="store_true");

    return parser.parse_args();

def discover_sinks():
    sinks = [];

    sinks_list_output = str(subprocess.check_output(["pactl", "list", "short", "sinks"]));
    sinks_list_output = sinks_list_output.strip("b\'\\n");
    sinks_list_lines  = sinks_list_output.split('\\n');

    sink_no = 1;
    for sink_line in sinks_list_lines:
        sink_split = sink_line.split('\\t');
        sink = sink_split[1];

        sinks.append(("Sink " + str(sink_no) + " (" + sink + ")", sink));
        sink_no += 1;

    return sinks;

def get_sinks(sink_file):
    sinks = [];

    if (sink_file):
        sink_file_dict = {};
        print("Read sink definitions from file:", sink_file);
        exec(open(sink_file).read(), globals(), sink_file_dict);
        sinks = sink_file_dict['sinks'];
    else:
        sinks = discover_sinks();

    if (not sinks):
        print("No sinks found! Quitting.");
        exit(-1);

    print(sinks);

    return sinks;

def main():
    (options, args) = arg_parse();

    sinks = get_sinks(options.sink_file);

    current_sink_id = str(subprocess.check_output(["pactl", "get-default-sink"]));
    current_sink_id = current_sink_id.strip("b\'\\n");

    print("Current sink:\t" + str(current_sink_id));

    # Find current sink index.
    idx = 0;
    for sink in sinks:
        sink_id = sink[1];
        if (sink_id == current_sink_id):
            idx = sinks.index(sink);

    # Next index.
    idx += 1;
    idx = idx % len(sinks);

    sink_name = sinks[idx][0];
    sink_id   = sinks[idx][1];

    print("New sink:\t" + sink_id);

    subprocess.run(["pactl", "set-default-sink", sink_id]);
    if (not options.no_notify_send):
        subprocess.run([
            "notify-send",
            "-t",
            "1500",
            "-h",
            "string:x-canonical-private-synchronous:pwcycle",
            "Audio Output: " + sink_name
        ]);

if __name__ == "__main__":
    main();

