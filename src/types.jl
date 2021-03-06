module Types

export Lesson

abstract AbstractQuestion

type Lesson
	name::AbstractString
	description::AbstractString
	version::VersionNumber
	authors::Array{AbstractString, 1}
	keywords::Array{AbstractString, 1}
	questions::Array{AbstractQuestion, 1}
end

immutable InfoQuestion <: AbstractQuestion
	text::AbstractString
end

immutable SyntaxQuestion <: AbstractQuestion
	text::AbstractString
	hints::Array{AbstractString, 1}
	answer::Expr
end

immutable FunctionQuestion <: AbstractQuestion
	text::AbstractString
	hints::Array{AbstractString, 1}
	# N.B. Because of JLD restrictions `test` needs to be an anonymous
	# (non-generic) function
	test::Function
end

immutable MultiQuestion <: AbstractQuestion
	text::AbstractString
	hints::Array{AbstractString, 1}
	options::Array{AbstractString, 1}
	answer::Int
end

type Course
	name::AbstractString
	description::AbstractString
	version::VersionNumber
	authors::Array{AbstractString, 1}
	keywords::Array{AbstractString, 1}
	lessons::Array{Lesson, 1}
end

end  # module
