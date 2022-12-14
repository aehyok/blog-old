import { baseUrl } from "./utils/common.mjs";
import { gitPull } from "./utils/git-pull.mjs";
import { yarnBuildBy, yarnBuildChildList } from "./utils/yarn-build.mjs";
import { gitTag } from "./utils/git-tag.mjs";
import { copyFile } from "./utils/copy-file.mjs";
import { gitPush } from "./utils/git-push.mjs";
import { updateVersion } from "./utils/fs-version.mjs";

export const build_app = async (tag,child) => {

  const { projectPath } = global.project

  const path = `${baseUrl()}\\${projectPath}`;
  const mainPath = path + "\\" + "main-app";
  
  const appChildListPath = [path + "\\\\" + "ffp-app"];

  console.log('build_app', 'appversion');
  // await backupFile();
  await gitPull();
  if(!child) {
    
    updateVersion(mainPath);

    await yarnBuildBy(mainPath);
  }

  await yarnBuildChildList(appChildListPath);

  if(tag) {
    await gitTag();
  }

  await copyFile()
  await gitPush()
};

