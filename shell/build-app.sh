# ## 当前脚本文件所在路径
source ./versions # 版本文件
current_path_app=$(cd $(dirname $0); pwd)
# ############# pc 相关模块编译路径 ################
# declare -A build_pathArray
# build_pathArray['dvs-main']="/e/work/git/dvs-2.x/dvs-server-ui-dev/dvs-main"
# build_pathArray['dvs-basic']="/e/work/git/dvs-2.x/dvs-server-ui-dev/dvs-basic"
# build_pathArray['dvs-cons']="/e/work/git/dvs-2.x/dvs-server-ui-dev/dvs-cons"
# build_pathArray['dvs-village']="/e/work/git/dvs-2.x/dvs-server-ui-dev/dvs-village"
# build_pathArray['dvs-digital']="/e/work/git/dvs-2.x/dvs-server-ui-dev/dvs-digital"
# build_pathArray['dvs-park']="/e/work/git/dvs-2.x/dvs-server-ui-dev/dvs-park"
# build_pathArray['dvs-geography']="/e/work/git/dvs-2.x/dvs-server-ui-dev/dvs-geography"

build_pathArray_app=(
"/e/work/git/dvs-2.x/dvs-app-h5-develop/main-app"
"/e/work/git/dvs-2.x/dvs-app-h5-develop/ffp-app"
)

function build_app_Function {
  for ((i=0;i<${#build_pathArray_app[*]};i++))
  do
    project_path_app=${build_pathArray_app[i]}
    echo -e "开始编译项目：${build_pathArray_app[i]} ";
    cd $project_path_app
    yarn build
    echo -e "编译APP 项目路径为{${build_pathArray_app[i]}} 成功";
    cd $current_path_app
    echo "tagVersion=\"$1\" # <<${build_pathArray_app[i]}>> # $(date)" >> ./versions
  done
}