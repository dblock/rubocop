# encoding: utf-8

module RuboCop
  module Cop
    module Test
      class StubbornCop < RuboCop::Cop::Cop
        def on_class(node)
          add_offense(node, :expression, 'I Am Stubborn')
        end

        def autocorrect(node)
          @corrections << lambda do |corrector|
            corrector.replace(node.loc.expression,
                              "class X#{SecureRandom.hex}\nend")
          end
        end
      end
    end
  end
end
