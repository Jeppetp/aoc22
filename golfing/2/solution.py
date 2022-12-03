print(
    list(
        map(
            sum,
            zip(
                *[
                    [
                        3 * (((t := ord(a[2])) % ord(a[0]) + 2) % 3) + (t - 1) % 3 + 1,
                        3 * ((t - 1) % 3) + (ord(a[0]) + t - 1) % 3 + 1,
                    ]
                    for a in open("i").readlines()
                ]
            ),
        )
    )
)
print(
    list(
        map(
            sum,
            zip(
                *[
                    [
                        3 * (((t := ord(a[2])) % ord(a[0]) + 2) % 3)
                        + (h := (t - 1) % 3)
                        + 1,
                        3 * h + (ord(a[0]) + t - 1) % 3 + 1,
                    ]
                    for a in open("i").readlines()
                ]
            ),
        )
    )
)
