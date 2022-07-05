module ListingsHelper
    def format_condition(condition)
        words = condition.split("_").map do |word| 
            word.capitalize
        end
        words.join(" ")
    end

    def format_sold(sold)
        words = sold.map do |word|
            word.capitalize
        end
    end
end
