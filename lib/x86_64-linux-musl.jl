using CEnum: CEnum, @cenum

"""
    aws_checksums_library_init(allocator)

Initializes internal data structures used by aws-checksums. MUST be called before using any functionality in aws-checksums. Note: historically aws-checksums lazily initialized stuff and things worked without init. However, DO NOT rely on that behavior and explicitly call init instead.

### Prototype
```c
void aws_checksums_library_init(struct aws_allocator *allocator);
```
"""
function aws_checksums_library_init(allocator)
    ccall((:aws_checksums_library_init, libaws_checksums), Cvoid, (Ptr{aws_allocator},), allocator)
end

"""
    aws_checksums_library_clean_up()

Shuts down the internal data structures used by aws-checksums.

### Prototype
```c
void aws_checksums_library_clean_up(void);
```
"""
function aws_checksums_library_clean_up()
    ccall((:aws_checksums_library_clean_up, libaws_checksums), Cvoid, ())
end

"""
    aws_checksums_crc32(input, length, previous_crc32)

The entry point function to perform a CRC32 (Ethernet, gzip) computation. Selects a suitable implementation based on hardware capabilities. Pass 0 in the previousCrc32 parameter as an initial value unless continuing to update a running crc in a subsequent call.

### Prototype
```c
uint32_t aws_checksums_crc32(const uint8_t *input, int length, uint32_t previous_crc32);
```
"""
function aws_checksums_crc32(input, length, previous_crc32)
    ccall((:aws_checksums_crc32, libaws_checksums), UInt32, (Ptr{UInt8}, Cint, UInt32), input, length, previous_crc32)
end

"""
    aws_checksums_crc32_ex(input, length, previous_crc32)

The entry point function to perform a CRC32 (Ethernet, gzip) computation. Supports buffer lengths up to size\\_t max. Selects a suitable implementation based on hardware capabilities. Pass 0 in the previousCrc32 parameter as an initial value unless continuing to update a running crc in a subsequent call.

### Prototype
```c
uint32_t aws_checksums_crc32_ex(const uint8_t *input, size_t length, uint32_t previous_crc32);
```
"""
function aws_checksums_crc32_ex(input, length, previous_crc32)
    ccall((:aws_checksums_crc32_ex, libaws_checksums), UInt32, (Ptr{UInt8}, Csize_t, UInt32), input, length, previous_crc32)
end

"""
    aws_checksums_crc32c(input, length, previous_crc32c)

The entry point function to perform a Castagnoli CRC32c (iSCSI) computation. Selects a suitable implementation based on hardware capabilities. Pass 0 in the previousCrc32 parameter as an initial value unless continuing to update a running crc in a subsequent call.

### Prototype
```c
uint32_t aws_checksums_crc32c(const uint8_t *input, int length, uint32_t previous_crc32c);
```
"""
function aws_checksums_crc32c(input, length, previous_crc32c)
    ccall((:aws_checksums_crc32c, libaws_checksums), UInt32, (Ptr{UInt8}, Cint, UInt32), input, length, previous_crc32c)
end

"""
    aws_checksums_crc32c_ex(input, length, previous_crc32c)

The entry point function to perform a Castagnoli CRC32c (iSCSI) computation. Supports buffer lengths up to size\\_t max. Selects a suitable implementation based on hardware capabilities. Pass 0 in the previousCrc32 parameter as an initial value unless continuing to update a running crc in a subsequent call.

### Prototype
```c
uint32_t aws_checksums_crc32c_ex(const uint8_t *input, size_t length, uint32_t previous_crc32c);
```
"""
function aws_checksums_crc32c_ex(input, length, previous_crc32c)
    ccall((:aws_checksums_crc32c_ex, libaws_checksums), UInt32, (Ptr{UInt8}, Csize_t, UInt32), input, length, previous_crc32c)
end

"""
    aws_checksums_crc64nvme(input, length, previous_crc64)

The entry point function to perform a CRC64-NVME (a.k.a. CRC64-Rocksoft) computation. Selects a suitable implementation based on hardware capabilities. Pass 0 in the previousCrc64 parameter as an initial value unless continuing to update a running crc in a subsequent call. There are many variants of CRC64 algorithms. This CRC64 variant is bit-reflected (based on the non bit-reflected polynomial 0xad93d23594c93659) and inverts the CRC input and output bits.

### Prototype
```c
uint64_t aws_checksums_crc64nvme(const uint8_t *input, int length, uint64_t previous_crc64);
```
"""
function aws_checksums_crc64nvme(input, length, previous_crc64)
    ccall((:aws_checksums_crc64nvme, libaws_checksums), UInt64, (Ptr{UInt8}, Cint, UInt64), input, length, previous_crc64)
end

"""
    aws_checksums_crc64nvme_ex(input, length, previous_crc64)

The entry point function to perform a CRC64-NVME (a.k.a. CRC64-Rocksoft) computation. Supports buffer lengths up to size\\_t max. Selects a suitable implementation based on hardware capabilities. Pass 0 in the previousCrc64 parameter as an initial value unless continuing to update a running crc in a subsequent call. There are many variants of CRC64 algorithms. This CRC64 variant is bit-reflected (based on the non bit-reflected polynomial 0xad93d23594c93659) and inverts the CRC input and output bits.

### Prototype
```c
uint64_t aws_checksums_crc64nvme_ex(const uint8_t *input, size_t length, uint64_t previous_crc64);
```
"""
function aws_checksums_crc64nvme_ex(input, length, previous_crc64)
    ccall((:aws_checksums_crc64nvme_ex, libaws_checksums), UInt64, (Ptr{UInt8}, Csize_t, UInt64), input, length, previous_crc64)
end

"""
    aws_checksums_crc32_combine(crc1, crc2, len2)

Combines two CRC32 (Ethernet, gzip) checksums computed over separate data blocks. This is equivalent to computing the CRC32 of the concatenated data blocks without having to re-scan the data.

Given: crc1 = CRC32(data\\_block\\_A) crc2 = CRC32(data\\_block\\_B)

This function computes: result = CRC32(data\\_block\\_A || data\\_block\\_B)

# Arguments
* `crc1`: The CRC32 checksum of the first data block
* `crc2`: The CRC32 checksum of the second data block
* `len2`: The length (in bytes) of the original data that produced crc2. This is NOT the size of the checksum (which is always 4 bytes), but rather the size of the data block that was checksummed.
# Returns
The combined CRC32 checksum as if computed over the concatenated data
### Prototype
```c
uint32_t aws_checksums_crc32_combine(uint32_t crc1, uint32_t crc2, uint64_t len2);
```
"""
function aws_checksums_crc32_combine(crc1, crc2, len2)
    ccall((:aws_checksums_crc32_combine, libaws_checksums), UInt32, (UInt32, UInt32, UInt64), crc1, crc2, len2)
end

"""
    aws_checksums_crc32c_combine(crc1, crc2, len2)

Combines two CRC32C (Castagnoli, iSCSI) checksums computed over separate data blocks. This is equivalent to computing the CRC32C of the concatenated data blocks without having to re-scan the data.

Given: crc1 = CRC32C(data\\_block\\_A) crc2 = CRC32C(data\\_block\\_B)

This function computes: result = CRC32C(data\\_block\\_A || data\\_block\\_B)

# Arguments
* `crc1`: The CRC32C checksum of the first data block
* `crc2`: The CRC32C checksum of the second data block
* `len2`: The length (in bytes) of the original data that produced crc2. This is NOT the size of the checksum (which is always 4 bytes), but rather the size of the data block that was checksummed.
# Returns
The combined CRC32C checksum as if computed over the concatenated data
### Prototype
```c
uint32_t aws_checksums_crc32c_combine(uint32_t crc1, uint32_t crc2, uint64_t len2);
```
"""
function aws_checksums_crc32c_combine(crc1, crc2, len2)
    ccall((:aws_checksums_crc32c_combine, libaws_checksums), UInt32, (UInt32, UInt32, UInt64), crc1, crc2, len2)
end

"""
    aws_checksums_crc64nvme_combine(crc1, crc2, len2)

Combines two CRC64-NVME (CRC64-Rocksoft) checksums computed over separate data blocks. This is equivalent to computing the CRC64-NVME of the concatenated data blocks without having to re-scan the data.

Given: crc1 = CRC64\\_NVME(data\\_block\\_A) crc2 = CRC64\\_NVME(data\\_block\\_B)

This function computes: result = CRC64\\_NVME(data\\_block\\_A || data\\_block\\_B)

# Arguments
* `crc1`: The CRC64-NVME checksum of the first data block
* `crc2`: The CRC64-NVME checksum of the second data block
* `len2`: The length (in bytes) of the original data that produced crc2. This is NOT the size of the checksum (which is always 8 bytes), but rather the size of the data block that was checksummed.
# Returns
The combined CRC64-NVME checksum as if computed over the concatenated data
### Prototype
```c
uint64_t aws_checksums_crc64nvme_combine(uint64_t crc1, uint64_t crc2, uint64_t len2);
```
"""
function aws_checksums_crc64nvme_combine(crc1, crc2, len2)
    ccall((:aws_checksums_crc64nvme_combine, libaws_checksums), UInt64, (UInt64, UInt64, UInt64), crc1, crc2, len2)
end

"""
    aws_xxhash_type

Documentation not found.
"""
@cenum aws_xxhash_type::UInt32 begin
    XXHASH64 = 0
    XXHASH3_64 = 1
    XXHASH3_128 = 2
end

"""
Documentation not found.
"""
mutable struct aws_xxhash_impl end

"""
    aws_xxhash

Documentation not found.
"""
struct aws_xxhash
    allocator::Ptr{aws_allocator}
    type::aws_xxhash_type
    impl::Ptr{aws_xxhash_impl}
end

"""
    aws_xxhash64_new(allocator, seed)

Allocates and initializes a XXHASH64 hash instance.

### Prototype
```c
struct aws_xxhash *aws_xxhash64_new(struct aws_allocator *allocator, uint64_t seed);
```
"""
function aws_xxhash64_new(allocator, seed)
    ccall((:aws_xxhash64_new, libaws_checksums), Ptr{aws_xxhash}, (Ptr{aws_allocator}, UInt64), allocator, seed)
end

"""
    aws_xxhash3_64_new(allocator, seed)

Allocates and initializes a XXHASH3 64bit hash instance.

### Prototype
```c
struct aws_xxhash *aws_xxhash3_64_new(struct aws_allocator *allocator, uint64_t seed);
```
"""
function aws_xxhash3_64_new(allocator, seed)
    ccall((:aws_xxhash3_64_new, libaws_checksums), Ptr{aws_xxhash}, (Ptr{aws_allocator}, UInt64), allocator, seed)
end

"""
    aws_xxhash3_128_new(allocator, seed)

Allocates and initializes a XXHASH3 128bit hash instance.

### Prototype
```c
struct aws_xxhash *aws_xxhash3_128_new(struct aws_allocator *allocator, uint64_t seed);
```
"""
function aws_xxhash3_128_new(allocator, seed)
    ccall((:aws_xxhash3_128_new, libaws_checksums), Ptr{aws_xxhash}, (Ptr{aws_allocator}, UInt64), allocator, seed)
end

"""
    aws_xxhash_update(hash, data)

Update hash state from the data. Can return error. Hash is unusable after error;

### Prototype
```c
int aws_xxhash_update(struct aws_xxhash *hash, struct aws_byte_cursor data);
```
"""
function aws_xxhash_update(hash, data)
    ccall((:aws_xxhash_update, libaws_checksums), Cint, (Ptr{aws_xxhash}, aws_byte_cursor), hash, data)
end

"""
    aws_xxhash_finalize(hash, out)

Write out bytes of the hash to out. Out buffer should be allocated by caller and should have enough capacity. Hash is written out in big-endian, i.e. network order.

### Prototype
```c
int aws_xxhash_finalize(struct aws_xxhash *hash, struct aws_byte_buf *out);
```
"""
function aws_xxhash_finalize(hash, out)
    ccall((:aws_xxhash_finalize, libaws_checksums), Cint, (Ptr{aws_xxhash}, Ptr{Cvoid}), hash, out)
end

"""
    aws_xxhash_destroy(hash)

Destroy allocated hash.

### Prototype
```c
void aws_xxhash_destroy(struct aws_xxhash *hash);
```
"""
function aws_xxhash_destroy(hash)
    ccall((:aws_xxhash_destroy, libaws_checksums), Cvoid, (Ptr{aws_xxhash},), hash)
end

"""
    aws_xxhash64_compute(seed, data, out)

Compute XXH64 hash.

### Prototype
```c
int aws_xxhash64_compute(uint64_t seed, struct aws_byte_cursor data, struct aws_byte_buf *out);
```
"""
function aws_xxhash64_compute(seed, data, out)
    ccall((:aws_xxhash64_compute, libaws_checksums), Cint, (UInt64, aws_byte_cursor, Ptr{Cvoid}), seed, data, out)
end

"""
    aws_xxhash3_64_compute(seed, data, out)

Compute XXH3\\_64 hash.

### Prototype
```c
int aws_xxhash3_64_compute(uint64_t seed, struct aws_byte_cursor data, struct aws_byte_buf *out);
```
"""
function aws_xxhash3_64_compute(seed, data, out)
    ccall((:aws_xxhash3_64_compute, libaws_checksums), Cint, (UInt64, aws_byte_cursor, Ptr{Cvoid}), seed, data, out)
end

"""
    aws_xxhash3_128_compute(seed, data, out)

Compute XXH3\\_128 hash.

### Prototype
```c
int aws_xxhash3_128_compute(uint64_t seed, struct aws_byte_cursor data, struct aws_byte_buf *out);
```
"""
function aws_xxhash3_128_compute(seed, data, out)
    ccall((:aws_xxhash3_128_compute, libaws_checksums), Cint, (UInt64, aws_byte_cursor, Ptr{Cvoid}), seed, data, out)
end

