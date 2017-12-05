module ApplicationHelper
    def title(*parts)
        unless parts.empty?
            content_for :title do
                "Task - " + parts.join(" - ")
            end
        end
    end
end