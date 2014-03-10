#!/usr/bin/env ruby
require 'optparse'
require 'httpclient'

URL="http://standards.ieee.org/develop/regauth/oui/oui.txt"
CACHE="#{ENV['HOME']}/.oui"
REG=/^\s+(..)-(..)-(..)\s+\(hex\)\s+(.+)$/

$reload = false
$debug = false

opt = OptionParser.new
opt.on('-r') {|v| $reload = true }
opt.on("-d") {|v| $debug = true }
opt.parse!(ARGV)

target = ARGV.shift
if target == nil or !target.match(/..:..:../)
  print "ouisearch [-d] [-r] XX:XX:XX\n"
  exit 1
end

def dprint str
  return nil unless $debug
  print str
end

def parse_oui chunk, src
  ouis = {}
  lines = chunk.split("\n")
  lines.each do |line|
    match = line.match(REG)
    next unless match
    oui = match[1] + ":" + match[2] + ":" + match[3]
    vendor = match[4]
    ouis[oui] = vendor
  end
  return src.merge(ouis)
end

ouis = {}
if File.exists?(CACHE) == false or $reload
  if $reload
    dprint "force cache updating ($HOME/.oui) ...\n"
  else
    dprint "no cache ($HOME/.oui) found. creating cache ...\n"
  end

  File.open(CACHE, "w") do |f|
    hc = HTTPClient.new
    n = 0
    hc.get_content(URL) do |chunk|
      ouis = parse_oui(chunk, ouis)
      dprint "chunk #{n} loaded...\n"
      n += 1
    end
    p ouis
    f.write(Marshal.dump(ouis))
  end
  dprint "cache created (#{ouis.length} entries)\n"
else
  dprint "reloading cache from $HOME/.oui ...\n"
  File.open(CACHE, "r") do |f|
    ouis = Marshal.load(f.read)
  end
  dprint "cache reloading done\n"
end

vendor = ouis[target]
if vendor
  print "#{vendor}\n"
else
  print "No vendor found for #{target}"
end
