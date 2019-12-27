<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Attributes;
use App\Model\ChildAttribute;
use Auth;
use DB;

class AttributeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $attributes = new Attributes;
        if (Auth::user()->role_id != 1) {
            $attributes = $attributes->where('created_by', Auth::user()->id);
        }
        $attributes = $attributes->get();
        return view('Admin.product_management.attributes.index', compact('attributes'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('Admin.product_management.attributes.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'attribute'         => 'required',
            'attribute_arabic'  => 'required',
            'value.*'           => 'required',
        ]);

        try {
            DB::beginTransaction();
            $values = [
                'attribute' => $request->get('attribute'),
                'attribute_arabic'  => $request->get('attribute_arabic'),
                'created_by'    => Auth::user()->id,
            ];
            $getId = Attributes::create($values);

            if (count($request->get('value')) > 0) {
                foreach ($request->get('value') as $key => $value) {
                    ChildAttribute::create([
                        'attribute_id'  => $getId->id,
                        'value'         => strtolower($value),
                        'created_by'    => Auth::user()->id,
                    ]);
                }
            }
            DB::commit();
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()->with('error', __('language.alertMessage.internalServerError'));
        }
        return redirect()->to('attributes')->with('success', __('language.attribute').' '.__('language.alertMessage.created'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $attributes = Attributes::whereId($id)->first();
        if ($attributes != null)
            $attributes->value = explode(',', $attributes->value);
        return view('Admin.product_management.attributes.edit', compact('attributes'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'attribute'         => 'required',
            'attribute_arabic'  => 'required',
            'value.*'           => 'required',
        ]);

        try {
            DB::beginTransaction();
            $valuesArray = [
                'attribute'         => $request->get('attribute'),
                'attribute_arabic'  => $request->get('attribute_arabic'),
                'updated_by'    => Auth::user()->id,
            ];
            Attributes::whereId($id)->update($valuesArray);
            // insert value in the child table
            $getAtt = Attributes::whereId($id)->first();
            // dd($request->get('value'), $getAtt->childAttribute, $getAtt);
            if (count($request->get('value')) > 0) {
                foreach ($request->get('value') as $keys => $values) {
                    // foreach for request attribute of given id
                    $valueId = $request->get('value_id');
                    $isExist = ChildAttribute::where('id', $valueId[$keys])->first(); // if value is exist in table
                    if (!$isExist) {
                        // create if not exist in database
                        ChildAttribute::create([
                            'attribute_id'  => $id,
                            'value'         => $values,
                            'created_by'    => Auth::user()->id,
                        ]);
                    } else {
                        // update if exist in database
                        ChildAttribute::where('id', $isExist->id)->update([
                            'attribute_id'  => $id,
                            'value'         => $values,
                            'updated_by'    => Auth::user()->id,
                        ]);
                    }
                }
            }
            if($request->has('removeIds') && $request->get('removeIds') != '') {
                $explodeRemove = explode(',', $request->get('removeIds'));
                if (count($explodeRemove) > 0) {
                    foreach ($explodeRemove as $keyR => $valueR) {
                        ChildAttribute::destroy($valueR);
                    }
                }
            }
            DB::commit();
        } catch (\Exception $e) {
            DB::rollBack();
            dd($e);
            return redirect()->back()->with('error', __('language.alertMessage.internalServerError'));
        }
        return redirect()->to('attributes')->with('success', __('language.attribute').' '.__('language.alertMessage.updated'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            Attributes::destroy($id);
        } catch (\Throwable $th) {
            return response()->json(['error' => __('language.role').' '.__('language.alertMessage.internalServerError')]);
        }
        return response()->json(['success' =>  __('language.attribute').' '.__('language.alertMessage.deleted')]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroyChild(Request $request)
    {
        try {
            ChildAttribute::where('attribute_id', $request->get('patent'))->where('id', $request->get('child'))->delete();
        } catch (\Throwable $th) {
            //throw $th;
            return response()->json($th->getMessage());    
        }
        return response()->json(__('language.alertMessage.deleted'));
    }
}
