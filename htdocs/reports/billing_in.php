<!---This file contains billing div for selecting billing report period  -->
<div id='bill_div' style='display:none;' class='reports_subdiv'>
                    <b><?php echo "Billing Report"; ?></b>

                    <form name="bill_form" id="bill_form" action="billpg.php" method='post' target='_blank'>
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
                                    <input type="date" id="dt" name="dt"/>
                                </td>
                            </tr>

                            <tr valign='top'>
                                <td>
									<input type='submit' id='bill_report' name="bill_report" value='Submit'></input>
								</td>
                            </tr>
                        </table>
                    </form>

					<hr />

                </div>
