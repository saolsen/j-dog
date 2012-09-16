# Music analysis in julia
# Stephen Olsen
# My first goal is monophonic note recognition.

#require("sound.jl")

module Music
import Base.*

export get_bins

# I think this is called a spectrogram but whatever, going to just write what I
# need and worry about contributing it back later.

# ---

# Takes the samples (a 1dim array of the pcm wav file data)
# and it's sample rate and partitions it into a 2 dimentional array of bins.
function get_bins(samples, sample_rate, bins_per_second)
    # I'm assuming sample_rate is per second here.
    # I want each bin to be 1/10'th of a second. (arbitrarily, figure out later)
    audio = samples

    bin_length = int(sample_rate / bins_per_second)

    # pad samples with 0's so we can reshape to the correct dimentions.
    padding = bin_length - (length(audio) % bin_length)
    audio = cat(1, audio, zeros(padding))
    
    bins = reshape(audio, bin_length, int(length(audio) / bin_length))

    return bins
end

# Takes an array representing an audio file and a sample rate. It then returns
# an array of arrays that are each the fft for the audio file 1/10th of a second
# at a time. (that's the goal at least)

end #module
