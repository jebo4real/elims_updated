<!---This file contains billing div for selecting inventory report period  -->
<div id='inv_div' style='display:none;' class='reports_subdiv'>
                    <b><?php echo "Inventory Report"; ?></b>
                    <?php //$userStats = new UserStats(); ?>
                    <!--<br><br>

                <a id="ustats_a" class="ustats_link_u" href='javascript:show_user_stats_submenu(1);'>User Stats for All Users</a>
                |
                <a id="ustats_i" class="ustats_link_u" href='javascript:show_user_stats_submenu(2);'>User Logs for Individual Users</a>

                <br><br>-->

                  <!---For inventory supply report -->
                    <form name="supply_form" id="supply_form" action="supplypg.php" method='post' target='_blank'>
                        <table cellpadding="4px">
							<h4><?php echo "Supply"; ?></h4>
                            <tr valign='top'>
                                <td><?php echo LangUtil::$generalTerms['FROM_DATE']; ?> </td>
                                <td>
                  									<input type="date" id="df" name="df"/>
                                </td>
                            </tr>
                            <tr valign='top'>
                                <td><?php echo LangUtil::$generalTerms['TO_DATE']; ?> </td>
                                <td>
                                    <input type="date" id="df" name="dt"/>
                                </td>
                            </tr>

                            <tr valign='top'>
                                <td>
									<input type='submit' id='supply_report' name="suply_report" value='Submit'></input>

								</td>
                            </tr>
                        </table>
                    </form>

					<hr />
          <!---For inventory usage report  -->
					<form name="usage_form" id="usage_form" action="usagepg.php" method='post' target='_blank'>
                        <table cellpadding="4px">
							<h4><?php echo "Usage"; ?></h4>
                            <tr valign='top'>
                                <td><?php echo LangUtil::$generalTerms['FROM_DATE']; ?> </td>
                                <td>
									                    <input type="date" id="df" name="df"/>
                                </td>
                            </tr>
                            <tr valign='top'>
                                <td><?php echo LangUtil::$generalTerms['TO_DATE']; ?> </td>
                                <td>
                                    <input type="date" id="dt" name="dt"/>
                                </td>
                            </tr>

                            <tr valign='top'>
                                <td>
									<input type='submit' id='usage_report' name="usage_report" value='Submit'></input>
								</td>
                            </tr>
                        </table>
                    </form>
                </div>
