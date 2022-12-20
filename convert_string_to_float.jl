# the following function convert a string of numbers seperated by a comma and space
# the string of number must only contain 0 to 9 number character, decimal('.'), negative sign('-'), and comma(',').
# Example of argument "6, -7.9, 55, 2.999, -57"


function convert_string_to_number(string_of_numbers)
	inputₙᵤₘ = string_of_numbers
	filteredₙᵤₘ = filter(x -> !isspace(x), inputₙᵤₘ)
	charₗᵢₛₜ = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '.', '-', ',']
	char₂ₓ = ["..", "--", ",,", ".,", ",.", "-,", ".-", "-.", "1-", "2-", "3-", "4-", "5-", "6-", "7-", "8-", "9-", "0-"]
	commaₚₒₛ = []
	convₙᵤₘₛ = []
	nₗ = length(filteredₙᵤₘ)
	for i in 1:nₗ
		result = sum(charₗᵢₛₜ .== filteredₙᵤₘ[i])
		if result == 0
			return false
		end
	end
	for i in char₂ₓ
		if contains(filteredₙᵤₘ, i)
			return false
		end
	end
	for i in 1:nₗ
		if filteredₙᵤₘ[i] == ','
			if i == 1 || i == nₗ
				return false
			end
			push!(commaₚₒₛ , i)
		elseif i == nₗ
			push!(commaₚₒₛ , i)
		end
	end
	nₚₒₛ = length(commaₚₒₛ)
	for i in 1:nₚₒₛ
		if i == 1
			convₙᵤₘ = parse(Float64, filteredₙᵤₘ[1:(commaₚₒₛ[1]-1)])
			push!(convₙᵤₘₛ, convₙᵤₘ)
		elseif i == nₚₒₛ
			convₙᵤₘ = parse(Float64, filteredₙᵤₘ[(commaₚₒₛ[i-1]+1):(commaₚₒₛ[i])])
			push!(convₙᵤₘₛ, convₙᵤₘ)
		else
			convₙᵤₘ = parse(Float64, filteredₙᵤₘ[(commaₚₒₛ[i-1]+1):(commaₚₒₛ[i]-1)])
			push!(convₙᵤₘₛ, convₙᵤₘ)
		end
	end
	return convₙᵤₘₛ		
end