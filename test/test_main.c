#include <CUnit/Basic.h>
//#include "your_project_header.h"  // Include your headers for testing

// Test function
void test_addition(void) {
    CU_ASSERT(2 + 2 == 4);
}

int main() {
    // Initialize the CUnit test registry
    CU_initialize_registry();

    // Add a test suite
    CU_pSuite pSuite = CU_add_suite("Test Suite", 0, 0);

    // Add test cases to the suite
    CU_add_test(pSuite, "Test Addition", test_addition);

    // Run all the tests
    CU_basic_run_tests();

    // Clean up
    CU_cleanup_registry();

    return 0;
}
