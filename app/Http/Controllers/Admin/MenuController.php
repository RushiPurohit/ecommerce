<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Menu;

class MenuController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $menus = Menu::get();
        
        return view('Admin.menu.index',compact('menus'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('Admin.menu.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request,[
            'menu'      => 'required',
            'menu_ar'   => 'required',
            'routes'    => 'required',
            'icon'      => 'required'
        ]);

        Menu::create([
            'menu'      => $request->get('menu'),
            'menu_ar'   => $request->get('menu_ar'),
            'routes'    => $request->get('routes'),
            'icon'      => $request->get('icon'),
            'parent_id' => $request->get('parent_id')
        ]);
        
        return redirect()->to('menus')->with('success','Menu Created Successfully');
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
        $menus = Menu::whereId($id)->first();

        return view('Admin.menu.edit',compact('menus'));
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
        $this->validate($request,[
            'menu'      => 'required',
            'menu_ar'   => 'required',
            'routes'    => 'required',
            'icon'      => 'required'
        ]);

        Menu::whereId($id)->update([
            'menu'      => $request->get('menu'),
            'menu_ar'   => $request->get('menu_ar'),
            'routes'    => $request->get('routes'),
            'icon'      => $request->get('icon'),
            'parent_id' => $request->get('parent_id')
        ]);
        
        return redirect()->to('menus')->with('success','Menu Edited Successfully');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
