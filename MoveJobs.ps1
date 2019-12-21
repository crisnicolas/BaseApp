$JobFiles = Get-ChildItem C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\ -Name -Filter Job*

foreach ($File in $JobFiles)
{
    git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\$File  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
}

git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\AvailableJobPlanningLines.Page.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\ChangeJobDates.Report.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\ContactJobResponsibilities.Page.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\ContactJobResponsibility.Table.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\CopyJob.Codeunit.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\CopyJob.Page.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\CopyJobPlanningLines.Page.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\CopyJobTasks.Page.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\ItemsperJob.rdlc  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\ItemsperJob.Report.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\ManagerTimeSheetbyJob.Page.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\MyJob.Table.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\MyJobs.Page.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\OfficeJobJournal.Page.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\OfficeJobJournal.Table.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\OfficeJobsHandler.Codeunit.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\PBIJobActvBudgCost.Page.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\PBIJobActvBudgPrice.Page.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\PBIJobChartCalc.Codeunit.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\PBIJobProfitability.Page.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\PowerBIJobsList.Query.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\RecurringJobJnl.Page.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\ResGrAllocatedperJob.Page.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\ResGrpAllocperJobMatrix.Page.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\ResourceAllocatedperJob.Page.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\ResourceAllocperJobMatrix.Page.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\SuggestJobJnlLines.Report.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\TimeSheetLineJobDetail.Page.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\TopCustomersBySalesJob.Codeunit.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
git mv C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\BaseApp\UpdateJobItemCost.Report.al  C:\Cristina\Feina\Extensions\BaseAppBreakdown\BaseApp\Jobs
