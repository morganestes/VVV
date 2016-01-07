<?php
/**
 * Bail if not a WP-CLI request
 */
if ( ! defined( 'WP_CLI' ) ) {
	return;
}

class Setup_Command extends \WP_CLI_Command {

	/**
	 * Install a number of test sites in a multisite environment.
	 */
	function install( $args, $assoc_args ) {
		$number = absint( $assoc_args['number'] );

		for ( $i = 0; $i <= $number; $i++ ) {
			\WP_CLI::run_command( array( 'site', 'create' ),
				array(
					'slug' => "site-{$number}",
					'title' => "Test Site $number",
				)
			);
		}

		\WP_CLI::success( "$number sites created." );
	}

}

\WP_CLI::add_command( 'multisite', 'Setup_Command' );
