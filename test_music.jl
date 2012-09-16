# Script to call from the web repl
load("sound.jl")
load("/Users/steveo/dev/github/j-dog/music.jl")

import Sound.*
import Music.*

c = wavread("/Users/steveo/data/sound/c4.wav")
audio = c[1][:,1]
sr = c[2]

binned = get_bins(audio, sr, 10)
