#!/usr/bin/env jruby
# Original version is here: http://www.oracle.com/technetwork/jp/ondemand/java/20110519-java-a-2-sato-400530-ja.pdf
# Modified by Hiroshi Nakamura <nahi@ruby-lang.org>

require 'jrubyfx'

class HelloJRubyFX < JRubyFX::Application

  def start(stage)
    with(stage, width: 300, height: 300, title: 'Hello JRubyFX') do
      layout_scene(:dark_blue) do
        group do
          rectangle(x: 10, y: 40, width: 50, height: 50, fill: :red) do
            translate_x = translateXProperty # note we must do this here as its on the rectangle, not the timeline
            timeline(cycle_count: :indefinite, auto_reverse: true) do
              animate translate_x, 0.sec => 1.sec, 0 => 200
            end.play
          end
        end
      end
      show
    end
  end
end

HelloJRubyFX.launch
