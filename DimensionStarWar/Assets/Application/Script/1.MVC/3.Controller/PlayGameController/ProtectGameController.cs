﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ProtectGameController : BaseController {

    private ProtectGameCtrData data;

    #region 开始

    public override void StartController()
    {
        base.StartController();
        BuildData();
        CheckMode();
    }

    #endregion

    #region 结束
    public override void EndController()
    {
        base.EndController();

        data.getProtectGameCtr_Basic.EndCtr();

        data.Clear();
    }
    #endregion

    private void BuildData()
    {
        if(data == null)data =new ProtectGameCtrData();
        data.BuildData(this);
    }

    #region 打开AR

    private void OpenAR()
    {

    }

    private void FinishSetAR()
    {

    }
    #endregion 

    #region 根据boss 生成 模式

    private void CheckMode()
    {
        switch(JIRVIS.Instance.jIRVISData.getCurProtectStrongholdAttr.statueID)
        {
            case 2000:
                break;
            case 2001:
                data.BuildMode_2001();
                data.getProtectGameCtr_Basic.StartCtr();
                break;
            case 2002:
                break;
        }
    }

    #endregion

    #region 上传游戏数据

    public void UploadSkillData()
    {
        data.isWin = data.getProtectGameCtr_Basic.protectGameData_Basic.isWin;
        List<BattelResult> battelResults = new List<BattelResult>();
        BattelResult battelResult = new BattelResult();
        PlayerMonsterAttribute pma = data.getProtectGameCtr_Basic.protectGameData_Basic.currentMonsterData;
        MonsterBasic monsterBasic = data.getProtectGameCtr_Basic.protectGameData_Basic.currentMonsterItem;
        battelResult.monsterId = pma.monsterID;
        battelResult.monsterIndex = pma.monsterIndex;
        battelResult.currentPower = monsterBasic.monsterDataValue.monsterCurrentPower;
        battelResult.maxPower = pma.monsterMaxPower + 50;// + data.getEnemyMonster.monsterDataValue.monsterMaxPower;
        battelResult.skills = new List<BattelSkill>();
        int useSkillcount = monsterBasic.monsterDataValue.monsterUseSkillValueList.Count;
        for (int i = 0; i < useSkillcount; i++)
        {
            MonsterUseSkillValue monsterUseSkillValue = monsterBasic.monsterDataValue.monsterUseSkillValueList[i];
            BattelSkill battelSkill = new BattelSkill
            {
                skillId = monsterUseSkillValue.skillID,
                skillIndex = monsterUseSkillValue.skillIndex,
                value = AndaDataManager.Instance.CucalSkillArchievementValue(monsterUseSkillValue.value,
                                                                             monsterUseSkillValue.skillType,
                                                                             true),
            };

            battelResult.skills.Add(battelSkill);
        }
        battelResults.Add(battelResult);

        string json = LitJson.JsonMapper.ToJson(battelResults);
        //Debug.Log("json:" + json);


        AndaDataManager.Instance.CallServerUploadGameResult(JIRVIS.Instance.jIRVISData.currentPlayGameType, data.isWin ? 1 : 2, battelResults, CallbackFinishUploadGameresult);

    }


    #endregion

    private void CallbackFinishUploadGameresult(bool isSuccess)
    {
        if (isSuccess)
        {
            Invoke("InvockReadReward", 3f);
        }
        else
        {

            JIRVIS.Instance.PlayTips("尊敬的读星者，如果您看到这条提示，奖励物品被中途截断，下次要小心哦");
            InvovkOutGame();
            //UploadSkillData();
        }
    }

    private void InvovkOutGame()
    {
        callbackFinishController(ONAME.MAPCONCTROLLER);
    }

    private void InvockReadReward()
    {
        JIRVISListenerEvent.JIRVISEvent_CloseSecondBar += CloseRewardBar;
        JIRVIS.Instance.CheckReward();
    }

    private void CloseRewardBar()
    {
        JIRVISListenerEvent.JIRVISEvent_CloseSecondBar -= CloseRewardBar;
        InvovkOutGame();
    }

}
