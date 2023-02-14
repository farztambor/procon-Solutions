#!/usr/bin/ruby
#prepare http://www.ncbi.nlm.nih.gov/CBBresearch/Schaffer/msa.html
require 'zlib'
require 'base64'
require 'tempfile'
MSA=RUBY_PLATFORM=~/linux/ ? './msa' : 'msa'
File.binwrite('msa',Zlib.inflate(Base64.decode64(DATA.read)))
File.chmod(0755,'msa')

Tempfile.open('fasta','.'){|fasta|
Tempfile.open('cost','.'){|cost|
	gets
	seqs=$<.map(&:chomp)
	outseqs=seqs.map{''.dup}
	seqs.each_with_index{|e,i|fasta.puts ">#{i}\n#{e}"}
	s='-ACDEFGHIKLMNPQRSTVWY'
	cost.puts 0
	s.chars{|e|
		s.chars{|f|
			cost.puts "#{e} #{f} #{e==f ? 0 : 1}"
		}
	}
	fasta.flush
	cost.flush
	io = open(%Q(| "#{MSA}" -m -o -b -g -c "#{File.basename cost.path}" "#{File.basename fasta.path}"))
	until io.gets=~/Heuristic/ do; end
	io.gets
	io.gets
	outseqs = seqs.size.times.map{|i|io.gets.chomp}
	puts outseqs
}}
File.unlink('msa')

__END__
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
80cN3V/L6x8nxuYxC/41B6ifgyylEx8=
