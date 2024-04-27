using LibAwsChecksums
using Documenter

DocMeta.setdocmeta!(LibAwsChecksums, :DocTestSetup, :(using LibAwsChecksums); recursive=true)

makedocs(;
    modules=[LibAwsChecksums],
    repo="https://github.com/JuliaServices/LibAwsChecksums.jl/blob/{commit}{path}#{line}",
    sitename="LibAwsChecksums.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://github.com/JuliaServices/LibAwsChecksums.jl",
        assets=String[],
        size_threshold=2_000_000, # 2 MB, we generate about 1 MB page
        size_threshold_warn=2_000_000,
    ),
    pages=["Home" => "index.md"],
)

deploydocs(; repo="github.com/JuliaServices/LibAwsChecksums.jl", devbranch="main")
