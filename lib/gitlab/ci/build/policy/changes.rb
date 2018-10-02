module Gitlab
  module Ci
    module Build
      module Policy
        class Changes < Policy::Specification
          def initialize(globs)
            @globs = Array(globs)
          end

          def satisfied_by?(pipeline, seed)
            return true unless pipeline.branch_updated?

            pipeline.modified_paths.any? do |path|
              @globs.any? do |glob|
                File.fnmatch?(glob, path, File::FNM_PATHNAME | File::FNM_DOTMATCH)
              end
            end
          end
        end
      end
    end
  end
end
