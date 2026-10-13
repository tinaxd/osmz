const std = @import("std");
const TagList = @import("./tags.zig").TagList;

const IdKind = enum {
    node,
    way,
    relation,
};

const Node = struct {
    id: i64,
    lat: i32, // unit: 1e-7
    lon: i32, // unit: 1e-7
    tags: TagList,
};

const Way = struct {
    id: i64,
    nodes: []i64,
    tags: TagList,
};

const Member = struct { kind: IdKind, id: i64, role: []u8 };

const Relation = struct {
    id: i64,
    members: []Member,
    tags: TagList,
};

test "Node create" {
    const n: Node = .{ .id = 1, .lat = 2, .lon = 3, .tags = .{ .count = 0, .keys = undefined, .values = undefined } };
    try std.testing.expect(n.id == 1);
}
