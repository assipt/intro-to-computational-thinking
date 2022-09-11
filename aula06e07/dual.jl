
struct D <: Number
    f::Tuple{Float64,Float64}
end
D(x,y) = D((x,y))
import Base: +,-,*,/,convert, promote_rule

+(x::D, y::D) = D(x.f .+ y.f)
-(x::D, y::D) = D(x.f .- y.f)
*(x::D, y::D) = D((x.f[1]*y.f[1], x.f[1]*y.f[2] + x.f[2]*y.f[1]))
/(x::D, y::D) = D((x.f[1]/y.f[1], (y.f[1]*x.f[2] - x.f[1]*y.f[2]) / y.f[1]^2))
convert(::Type{D}, x::Real) = D((x,zero(x)))
promote_rule(::Type{D}, ::Type{<:Number}) = D

Base.show(io::IO, x::D) = print(io, x.f[1], " + ", x.f[2], " ϵ")

