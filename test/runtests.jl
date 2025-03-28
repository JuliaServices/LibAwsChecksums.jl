using Test, Aqua, LibAwsChecksums, LibAwsCommon, CRC32c

@testset "LibAwsChecksums" begin
    @testset "aqua" begin
        Aqua.test_all(LibAwsChecksums, ambiguities=false)
        Aqua.test_ambiguities(LibAwsChecksums)
    end
    @testset "basic usage to test the library loads" begin
        alloc = aws_default_allocator() # important! this shouldn't need to be qualified! if we generate a definition for it in LibAwsChecksums that is a bug.
        LibAwsChecksums.init(alloc)
        input = rand(UInt8, 10)
        actual = aws_checksums_crc32c(input, 10, 0)
        expected = crc32c(input)
        @test actual == expected
    end
end
