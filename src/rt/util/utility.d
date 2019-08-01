/**
 * Contains various utility functions used by the runtime implementation.
 *
 * Copyright: Copyright Digital Mars 2016.
 * License: Distributed under the
 *      $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost Software License 1.0).
 *    (See accompanying file LICENSE)
 * Authors: Jacob Carlborg
 * Source: $(DRUNTIMESRC rt/util/_utility.d)
 */
module rt.util.utility;

/**
 * Asserts that the given condition is `true`.
 *
 * The assertion is independent from -release, by abort()ing. Regular assertions
 * throw an AssertError and thus require an initialized GC, which isn't the case
 * (yet or anymore) for the startup/shutdown code in this module
 * (called by CRT ctors/dtors etc.).
 */
package(rt) void safeAssert(
    bool condition, scope string msg, size_t line = __LINE__
) nothrow @nogc @safe
{
    import core.internal.abort;
    condition || abort(msg, __FILE__, line);
}